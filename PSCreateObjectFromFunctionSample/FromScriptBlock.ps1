$getMeMyObject = {
		param($propertyName)

        Write-Host $propertyName

		$prefix = 'pref'
		$suffix = 'suf'
        $retObj = @{}

        $retObj | Add-Member -Name old -MemberType ScriptProperty -Value {
            $propertyName + '-' + $suffix
        }.GetNewClosure()

        $retObj | Add-Member -Name new -MemberType ScriptProperty -Value {
            $prefix + '-' +$propertyName
        }.GetNewClosure()

        return $retObj
}

$res = (& $getMeMyObject -propertyName 'obj1'), (& $getMeMyObject -propertyName 'obj2'), (& $getMeMyObject -propertyName 'obj3')