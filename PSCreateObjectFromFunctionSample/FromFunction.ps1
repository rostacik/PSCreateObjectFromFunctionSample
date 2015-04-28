function getMeMyObject {
	[CmdletBinding()]
	Param([Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True)][string]$propertyName)

    Process {
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
}

$myVar = (getMeMyObject -propertyName 'myProperty1'), (getMeMyObject -propertyName 'myProperty2'), (getMeMyObject -propertyName 'myProperty3')