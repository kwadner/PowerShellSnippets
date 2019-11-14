# Author: Kiel Wadner
# License: None; use as you want

param (
    [switch]$Encode = $false,
    [switch]$Decode = $false,
    [string]$Text = $( Read-Host "String")
)

# Encode the value
if ($Encode -and !$Decode) {
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text);
    $EncodedText =[Convert]::ToBase64String($Bytes)
    Write-Host "`n ## RESULT:"
    Write-Host $EncodedText;
}
# Decode the value
elseif (!$Encode -and $Decode) {
    $DecodedText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($Text))
    Write-Host "`n ## RESULT:"
    Write-Host $DecodedText "`n"
}
else {
    Write-Host "Invalid options."
}