function mkcd
    mkdir -pv $argv;
    cd $argv;
end

function server
	python -m http.server 8000
end