Add-Type -AssemblyName System.Numerics

$Global:Once = 0

<#
  ===========================
  |  Initialization Script  |
  ===========================
#>

function NorCalc {
    while($true){
        Clear-Host
        Write-Host "Normal Calculator" -ForegroundColor DarkYellow
        "---------"
        try{
            [decimal]$num1 = Read-Host "Enter first number"
            [decimal]$num2 = Read-Host "Enter second number"
            $Operator = (Read-Host "Enter Operator (+, -, *, /, ^)").Trim()

            switch($Operator){
                "+"{
                    if($num1 -eq 1 -and $num2 -eq 1){
                        Write-Host "`nDude, Are you ok?" -ForegroundColor Cyan
                        Start-Sleep -Seconds 2
                        Clear-Host
                    }
                    Write-Host "Result: $($num1 + $num2)" -ForegroundColor Green
                }
                "-"{ Write-Host "Result: $($num1 - $num2)" -ForegroundColor Green }
                "*"{ Write-Host "Result: $($num1 * $num2)" -ForegroundColor Green }
                "/"{
                    if($num2 -eq 0){
                        Write-Host "You can't divide any number by zero." -ForegroundColor DarkRed
                    }else{
                        Write-Host "Result: $($num1 / $num2)" -ForegroundColor Green
                    }
                }
                "^"{
                    Write-Host "Result: $([System.Math]::Pow($num1, $num2))" -ForegroundColor Green
                    Write-Host "Result: $([System.Numerics.BigInteger]::Pow($num1, $num2))" -ForegroundColor Cyan
                }
                default{ Write-Host "ERROR: Unknow operator" -ForegroundColor Red }
            }
        }Catch{
            Write-Host "Please enter Int or Decimal!" -ForegroundColor Red
        }
        $again = Read-Host "Want to Calc again? [Y/N]"
        if ($again -in @("n","N")){ Break }
    }
}

function Trigonometric {
    while($true){
        Clear-Host
        if($Global:Once -eq 0){
            Write-Warning "The unit used is radian, not degrees."
            $Global:Once += 1
            Start-Sleep -Seconds 2
            Clear-Host
        }
        Write-Host "Trigonometric Calculator" -ForegroundColor DarkYellow
        "---------"
        try{
            [decimal]$number = Read-Host "Enter a number"
            $Trigo = Read-Host "Enter Trigonometric (Sin, Cos, Tan)"
        
            switch($Trigo){
                "Sin"{ Write-Host "Result: $([System.Math]::Sin($number))" -ForegroundColor Green }
                "Cos"{ Write-Host "Result: $([System.Math]::Cos($number))" -ForegroundColor Green }
                "Tan"{ Write-Host "Result: $([System.Math]::Tan($number))" -ForegroundColor Green }
                default{ Write-Host "ERROR: Unknow" -ForegroundColor Red }
            }
        }Catch{
            Write-Host "Please enter Int or Decimal!" -ForegroundColor Red
        }
        $again = Read-Host "Want to Calc again? [Y/N]"
        if ($again -in @("n","N")){ Break }
    }
}

function Deltal {
    while($true){
        Clear-Host
        Write-Host "Deltal Calculator" -ForegroundColor DarkYellow
        "---------"
        try{
             $a = [decimal](Read-Host "Enter a")
             
             if($a -eq 0){
                Write-Warning "a must be different from zero."
                Start-Sleep -Seconds 2
                continue
             }

             $b = [decimal](Read-Host "Enter b")
             $c = [decimal](Read-Host "Enter c")

             $delta = ($b * $b) - (4 * $a * $c)
             
             if ($delta -gt 0) {
                 $x1 = (-$b + [Math]::Sqrt($delta)) / (2 * $a)
                 $x2 = (-$b - [Math]::Sqrt($delta)) / (2 * $a)
                 Write-Host "Delta > 0" -ForegroundColor DarkGray
                 Write-Host "x1 = $x1" -ForegroundColor Green
                 Write-Host "x2 = $x2" -ForegroundColor Green
             }
             elseif ($delta -eq 0) {
                 $x = -$b / (2 * $a)
                 Write-Host "Delta = 0" -ForegroundColor DarkGray
                 Write-Host "x = $x" -ForegroundColor Green
             }
             else {
                 Write-Host "Delta < 0" -ForegroundColor DarkGray
                 Write-Host "No real roots" -ForegroundColor Green
             }
        }Catch{
            Write-Host "Please enter Int or Decimal!" -ForegroundColor Red
        }
        $again = Read-Host "Want to Calc again? [Y/N]"
        if ($again -in @("n","N")){ Break }
    }
}

function TemperConversion {
    while($true){
        Clear-Host
        Write-Host "Degree Conversion" -ForegroundColor DarkYellow
        "---------"
        try{
            [decimal]$Degree = Read-Host "Enter degree"
            $Choice = (Read-Host "Convert to C or F?").ToUpper()

            switch($Choice){
                "F"{ Write-Host "Result: $($Degree * 9/5 + 32)°F" -ForegroundColor Green }
                "C"{ Write-Host "Result: $(($Degree - 32) * 5/9)°C" -ForegroundColor Green }
                default{ Write-Host "ERROR: Unknow" -ForegroundColor Red }
            }
        }Catch{
            Write-Host "Please enter Int or Decimal!" -ForegroundColor Red
        }
        $again = Read-Host "Want to Calc again? [Y/N]"
        if ($again -in @("n","N")){ Break }
    }
}

function CompareCalc{
    while($true){
        Clear-Host
        Write-Host "Compare" -ForegroundColor DarkYellow
        "---------"
        try{
            [decimal]$num1 = Read-Host "Enter first number"
            [decimal]$num2 = Read-Host "Enter second number"
            $Operator = (Read-Host "Enter Operator (+, -, *, /, ^)").Trim()
            [decimal]$num3 = Read-Host "Enter third number"

            switch($Operator){
                "+"{ Write-Host "Result: $($num1 + $num2 -eq $num3)" -ForegroundColor Green }
                "-"{ Write-Host "Result: $($num1 - $num2 -eq $num3)" -ForegroundColor Green }
                "*"{ Write-Host "Result: $($num1 * $num2 -eq $num3)" -ForegroundColor Green }
                "/"{
                    if($num2 -eq 0){
                        Write-Host "Stupid! You can't divide any number by zero." -ForegroundColor DarkRed
                    }else{
                        Write-Host "Result: $($num1 / $num2 -eq $num3)" -ForegroundColor Green
                    }
                }
                "^"{ Write-Host "Result: $([System.Math]::Pow($num1, $num2) -eq $num3)" -ForegroundColor Green }
                default{ Write-Host "ERROR: Unknow operator" -ForegroundColor Red }
            }
        }Catch{
            Write-Host "Please enter Int or Decimal!" -ForegroundColor Red
        }
        $again = Read-Host "Want to Compare again? [Y/N]"
        if ($again -in @("n","N")){ Break }
    }
}

function Write-AboutMe {
    Clear-Host
    [String[]]$AboutMe = @(
        "Hi! I'm Hanjin, or you can call me DevCore.`n"
        "I'm a programmer who's new to PowerShell, and this is my first project.`n"
        "Although it's just a simple calculator, it's my whole heart and soul :))`n`n"
    )

    ForEach($Me in $AboutMe.ToCharArray()){
        Write-Host $Me -NoNewline -ForegroundColor Cyan
        Start-Sleep -Milliseconds 50
    }
    Pause
}

$title = @(
    "=======================",
    "|   CALCULATOR V1.0   |",
    "======================="
)

$Choose = @(
    "========================",
    "| 1. Normal Calculator |",
    "| 2. Trigonometric     |",
    "| 3. Delta             |",
    "| 4. Degree Conversion |",
    "| 5. Compare           |",
    "| 6. About me          |",
    "| 7. Exit              |",
    "========================"
)

<#
  -----------------
  |  Main Script  |
  -----------------
#>

while($true){
    Clear-Host
    ForEach($Ontop in $title){ Write-Host $Ontop -ForegroundColor Blue}
    ForEach($menu in $Choose){ Write-Host $menu -ForegroundColor Cyan }
    "`n"
    $Choice = Read-Host "Enter Choice"

    switch($Choice){
        1{ NorCalc }; 4{ TemperConversion }
        2{ Trigonometric }; 5{ CompareCalc }
        3{ Deltal }; 6{ Write-AboutMe }; 7{ Break 2 }
        default{ Write-Host "ERROR: Not On the list" -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
}

