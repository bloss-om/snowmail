docker:
	@docker-compose up -d

migrate:
	@mix ecto.migrate
	
reset:
	@mix ecto.drop
	@mix ecto.setup
	@$(MAKE) serve

serve:
	@iex -S mix phx.server

install:
	@mix deps.get