#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <dirent.h>

int main() {
    sleep(2);
    printf("---- Terevetulloo KUSeen! ----\n\n");

    while (1) {
        char ch;
        printf("> cd ");
        scanf("%c", &ch);

        struct dirent *de;
        DIR *dr = opendir(&ch);
        if (dr == NULL) {
            printf("Kusisia asioita on tapahtunut" );
            continue;
        }
        while ((de = readdir(dr)) != NULL)
                printf("%s\n", de->d_name);
        closedir(dr);
        printf("\n");
    }
}
