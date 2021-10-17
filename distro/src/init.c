#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <dirent.h>

int main() {
    sleep(2);
    printf("---- Terevetulloo KUSeen! ----\n\n");

    struct dirent *de;
    DIR *dr = opendir(".");
    if (dr == NULL) {
        printf("Kusisia asioita on tapahtunut" );
        return 0;
    }
    while ((de = readdir(dr)) != NULL)
            printf("%s\n", de->d_name);
    closedir(dr);


    printf("\n");

    while (1) {
        printf("|");
        sleep(1);
    }
}
