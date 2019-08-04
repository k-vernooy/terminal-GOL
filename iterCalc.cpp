#include <iostream>

using namespace std;

int main(int argc, char *argv[]) {
    std::cout << "height: " << argv[1] << endl;
    std::cout << "width: " << argv[2] << endl;

    for ( int i = argc - 1; i > 2; i--) {
        std::cout << "active: " << argv[i] << endl;
        // std::cout << i << endl;
    }
}