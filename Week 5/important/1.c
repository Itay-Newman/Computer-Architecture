#include <stdio.h>

int isPrime(int num)
{
    int i = 0;
    if (num <= 1)
    {
        return 0; // Numbers less than or equal to 1 are not prime
    }
    for (i = 2; i <= num / 2; i++)
    { // Check divisors up to num/2
        if (num % i == 0)
        {
            return 0; // Not a prime number
        }
    }
    return 1; // Prime number
}

int main()
{
    int publicKey = 0;
    int num = 0, num2 = 0;

    // Input the numbers that make up the totient
    printf("Enter two numbers to calculate the totient (e.g., prime numbers): \n");
    scanf("%d %d", &num, &num2);

    int totient = (num - 1) * (num2 - 1);
    printf("Calculated totient: %d\n", totient);

    // Input the public key
    printf("Enter a public key: \n");
    scanf("%d", &publicKey);

    int passedAllTests = 1; // Flag to track if all tests are passed

    // Test 1: Check if the public key is prime
    if (isPrime(publicKey))
    {
        printf("Test 1 Passed: The public key is prime.\n");
    }
    else
    {
        printf("Test 1 Failed: The public key is not prime.\n");
        passedAllTests = 0;
    }

    // Test 2: Check if the public key is less than the totient
    if (publicKey < totient)
    {
        printf("Test 2 Passed: The public key is less than the totient (%d).\n", totient);
    }
    else
    {
        printf("Test 2 Failed: The public key is not less than the totient (%d).\n", totient);
        passedAllTests = 0;
    }

    // Test 3: Check if the public key is coprime with the totient
    if (totient % publicKey != 0)
    {
        printf("Test 3 Passed: The public key is coprime with the totient.\n");
    }
    else
    {
        printf("Test 3 Failed: The public key is not coprime with the totient.\n");
        passedAllTests = 0;
    }

    // Final output
    if (passedAllTests)
    {
        int i = 0;

        printf("Yes, this number is a valid public key.\n");
        printf("Public key: %d\n", publicKey);

        // Calculate and display the private key
        for (i = 0; i <= totient; i++)
        {
            if ((publicKey * i) % totient == 1)
            {
                printf("Private key: %d\n", i);
                break;
            }
        }
    }
    else
    {
        printf("No, this number is not a valid public key.\n");
    }

    return 0;
}
