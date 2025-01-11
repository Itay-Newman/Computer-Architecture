#include <windows.h>
#include <stdio.h>

int main()
{
    CHAR buffer[2048] = { 0 };  // Initialize buffer
    DWORD bytesRead;
    char wait;

    HANDLE file = CreateFileA("lol.txt", GENERIC_READ, 0, NULL, OPEN_EXISTING, 0, NULL);

    if (file == INVALID_HANDLE_VALUE) {
        printf("Error opening file\n");
        scanf("%c", &wait);
        return GetLastError();
    }

    ReadFile(file, buffer, sizeof(buffer), &bytesRead, NULL);
    CloseHandle(file);

    printf("%s\n", buffer);
    scanf("%c", &wait);

    return 0;
}