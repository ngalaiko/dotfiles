return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	root_markers = { ".git" },
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/refs/tags/3.1.0/schemas/v3.0/schema.yaml"] = { "openapi.yaml", "openapi.yml", "**/openapi/*.yaml" },
				["https://json-schema.org/draft/2020-12/schema"] = { "*.schema.yaml", "*.schema.json" },
			},
		},
	},
}
