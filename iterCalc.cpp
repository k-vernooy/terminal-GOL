#include <iostream>
#include <vector> 

using namespace std;

void relevantTiles(vector<string> input) {
    for ( int i = 0; i < input.size(); i++) {
        cout << input[i] << endl;
    }
}

int main(int argc, char *argv[]) {
    std::cout << "height: " << argv[1] << endl;
    std::cout << "width: " << argv[2] << endl;

    vector<string> data;

    for ( int i = argc - 1; i > 2; i--) {
        // std::cout << "active: " << argv[i] << endl;
        data.push_back(argv[i]);
    }

    relevantTiles(data);
}