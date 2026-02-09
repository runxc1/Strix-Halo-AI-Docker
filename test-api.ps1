$body = @{
    messages = @(
        @{
            role = "user"
            content = "What is 5 times pi?"
        }
    )
    temperature = 0.2
    max_tokens = 500
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri "http://mortgage-lifter2:8080/v1/chat/completions" -Method Post -ContentType "application/json" -Body $body

Write-Host $response.choices[0].message.content
