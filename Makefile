.PHONY: docs docs-check

docs:
	./scripts/generate-docs.sh

docs-check:
	@before="$$(mktemp)"; \
	after="$$(mktemp)"; \
	sha256sum README.md modules/*/README.md > "$$before"; \
	./scripts/generate-docs.sh >/dev/null; \
	sha256sum README.md modules/*/README.md > "$$after"; \
	if ! diff -q "$$before" "$$after" >/dev/null; then \
		echo "Documentação desatualizada. Rode: make docs"; \
		rm -f "$$before" "$$after"; \
		exit 1; \
	fi; \
	rm -f "$$before" "$$after"
