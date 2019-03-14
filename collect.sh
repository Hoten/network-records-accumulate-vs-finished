#!/bin/bash

urls=(
    https://www.paulirish.com
    https://www.example.com
    https://exterkamp.codes
    https://www.cnn.com/
    https://github.com/
)

ns_options=(
    0
    1
)

chrome_path_options=(
    "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
)

function filename_safe() {
    echo $1 | sed -e 's/[^A-Za-z0-9._-]/_/g'
}

IFS=""
for chrome_path in ${chrome_path_options[*]}
do
    for ns in ${ns_options[@]}
    do
        run_dir="run-assets/$(filename_safe $chrome_path)-ns-$ns"
        mkdir -p $run_dir
        for url in ${urls[@]}
        do
            echo Url: $url
            
            if [ "$ns" -eq "0" ]; then
                flags='--chrome-flags="--disable-features=NetworkService"'
            else
                flags='--chrome-flags="--enable-features=NetworkService"'
            fi

            CHROME_PATH="$chrome_path" node lighthouse-cli $url $flags --save-assets --output-path $run_dir/$(filename_safe $url)
        done
    done
done
