use Mix.Config

config :csv_parser,
  app_name: "CSV Parser",
  environment: :dev,
  dev_user_id: 1,
  signing_salt: "/PZh9W5ua8mHBrkAeP2rdTh0KXYx78ytE9N1O8tPfDiNRR6vmKD22waPNBuGcUAH",
  test_csv_path: "C:/projects/able/leviticus/csv_parser/priv/static/employeeList.csv"

config :csv_parser, CSVParserWeb.Endpoint,
  secret_key_base: "LmEMD+XS9ll13w9JnqeTvXjkxvg5dbuBcSDoSrakpbSzTQU9F6h6mompHWbNUl+D",
  live_view: [signing_salt: "2BRPyogQBnWt7zm4+0MUr665EKzLKonYqiEbGyhuh51AQZ/r/06kM6H9nK/lBDTX"]

config :csv_parser, CSVParser.Repo,
  username: "postgres",
  password: "s2saPassword1",
  database: "csv_parser_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :csv_parser, CSVParser.Guardian,
  issuer: "twincity",
  secret_key: "FNRq14Qvc3QN8rS/yEMXy6Ro3AzY/8CWalkRPJGTwajh46+ZhFA7isVww5Ockv7P"

config :csv_parser,
  CSVParser.WebSocketsKey,
  "aUPBBDEMEt5hpaBR3nzIiRj6JF3JX/qV9v1CmEGYByZnOPOEZ1kWOLY/k5gMIez1"
