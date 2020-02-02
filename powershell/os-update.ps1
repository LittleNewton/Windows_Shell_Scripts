function Update-Packages {
	# update pip
	Write-Output("Step 1: update pip")
	$a = pip list --outdated
	$num_package = $a.Length - 2
	for ($i = 0; $i -lt $num_package; $i++) {
		$tmp = ($a[2 + $i].Split(" "))[0]
		pip install -U $tmp
	}

	# update TeX Live 2019
	Write-Output("Step 2: update TeX Live 2019")
	tlmgr update --self
	tlmgr update --all
}

Update-Packages
