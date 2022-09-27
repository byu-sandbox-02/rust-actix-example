local:
	RUST_LOG=debug cargo watch -x run

test:
	echo "Setting env variables and running tests"
	export $$(grep -v '^#' .env | xargs) && cargo test -- --nocapture

nextest:
	echo "Setting env variables and running tests"
	export $$(grep -v '^#' .env | xargs) && cargo nextest run

build:
	cargo build --release

env:
	cp .env.example .env

stripe:
	stripe listen --forward-to localhost:8080/stripe/webhook
