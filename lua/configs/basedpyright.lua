return {
	basedpyright = {
		disableOrganizeImports = true,
		disableTaggedHints = false,
		analysis = {
			typeCheckingMode = "off",
			useLibraryCodeForTypes = true, -- Analyze library code for type information
			autoImportCompletions = true,
			autoSearchPaths = true,
			diagnosticSeverityOverrides = {
				reportIgnoreCommentWithoutRule = true,
			},
			inlayHints = {
				variableTypes = true,
			},
		},
	},
}
