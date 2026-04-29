function sbom
    syft scan dir:.
end

function vuln
    # grype dir:. # it's slower and noisier...
    osv-scanner scan source -r .
end

function vuln-container
    # grype's output is noisy
    osv-scanner scan image $argv
end
