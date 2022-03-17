param (
    [parameter(Mandatory=$true)][string]$file,
    [parameter(Mandatory=$true)][string]$cmd,
    [parameter(Mandatory=$false)][string]$domain
)

$pcs = GC $file # get the list of pcs
Foreach ($pc in $pcs)	{
    if($domain -and !$pc.contains($domain)){#if the domain is set and doesnt exist at the end of the pc name
       $pc="$pc.$domain"
    }
    Invoke-Command -ComputerName $pc -ScriptBlock{ $cmd }
}
