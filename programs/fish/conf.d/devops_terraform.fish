function tf
  tofu $argv
end

function tfcost
    infracost breakdown --path .
end

function tfcost-html
    infracost breakdown \
        --format html \
        --out-file infracost-report.html \
        --usage-file /tmp/ignore.yml \
        --sync-usage-file \
        --path .
end

function tfdocs
    terraform-docs markdown table --html=false --anchor=false --output-file README.md --output-mode inject .
end
