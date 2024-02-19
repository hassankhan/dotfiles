abbr -a dcdn docker compose down
abbr -a dcb docker compose build
abbr -a dce docker compose exec
abbr -a dclf docker compose logs -f
abbr -a dcup docker compose up
abbr -a dcupd docker compose up -d
abbr -a dcps docker compose ps

abbr -a s subl

abbr -a public_ip "curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"
abbr -a local_ip ipconfig getifaddr en0

abbr -a la "ls -la"