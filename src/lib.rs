use zed_extension_api::{self as zed, CodeLabel, CodeLabelSpan};

pub struct MidenExtension {
    cached_binary_path: Option<String>,
}

impl zed::Extension for MidenExtension {
    fn new() -> Self
    where
        Self: Sized,
    {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let command = self
            .cached_binary_path
            .as_ref()
            .and_then(|path| {
                if std::fs::metadata(path).is_ok_and(|stat| stat.is_file()) {
                    Some(path.clone())
                } else {
                    None
                }
            })
            .or_else(|| worktree.which("miden-lsp"))
            .ok_or_else(|| "could not find 'miden' executable in $PATH".to_string())?;

        if self.cached_binary_path.is_none() {
            self.cached_binary_path = Some(command.clone());
        }

        let env = worktree.shell_env();
        Ok(zed::Command {
            command,
            //args: vec!["lsp".to_string()],
            args: vec![],
            env,
        })
    }

    fn label_for_completion(
        &self,
        _language_server_id: &zed::LanguageServerId,
        completion: zed::lsp::Completion,
    ) -> Option<zed::CodeLabel> {
        use zed::lsp::CompletionKind;

        let name = completion.label;
        let kind = completion.kind?;

        match kind {
            CompletionKind::Function | CompletionKind::Method | CompletionKind::Module => {
                Some(CodeLabel {
                    spans: vec![CodeLabelSpan::code_range(0..name.len())],
                    filter_range: (0..name.len()).into(),
                    code: name,
                })
            }
            _ => None,
        }
    }

    /*
    fn get_dap_binary(
        &mut self,
        adapter_name: String,
        config: DebugTaskDefinition,
        user_provided_debug_adapter_path: Option<String>,
        worktree: &Worktree,
    ) -> Result<DebugAdapterBinary, String> {
        todo!()
    }

    fn dap_request_kind(
        &mut self,
        _adapter_name: String,
        _config: Value,
    ) -> Result<StartDebuggingRequestArgumentsRequest, String> {
        todo!()
    }

    fn dap_config_to_scenario(
        &mut self,
        _adapter_name: DebugConfig,
    ) -> Result<DebugScenario, String> {
        todo!()
    }
     */
}

zed::register_extension!(MidenExtension);
