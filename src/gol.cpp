#include <iostream>
#include <vector>

using namespace std;

int main(int argc, char *argv[]) {
    for ( int i = 1; i < argc; i++ ) {
        cout << argv[i] << endl;
        // if ( argv[i] == string("-i") ) {
        //     system("./game");
        // }
        if ( argv[i] == string(argv[i]).substr(0,8)) {
            cout << argv[i] << " is a pattern" << endl;
        }
        // else if ( string(argv[i]).substr(1,5) == string("pattern("))
    }
}


