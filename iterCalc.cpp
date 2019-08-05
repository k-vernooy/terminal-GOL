#include <iostream>
#include <vector> 
#include <sstream> 
#include <string>

using namespace std;

vector<string> neighbors(std::string data) {
    string n1, n2, n3, n4, n5, n6, n7, n8;
    std::string d1 = data.substr(0, 1); 
    std::string d2 = data.substr(2, 1); 

    stringstream data1(d1); 
    int c1 = 0; 
    data1 >> c1; 

    stringstream data2(d2); 
    int c2 = 0; 
    data2 >> c2; 

    int c1p, c1m, c2p, c2m;
    c1p = c1 + 1;
    c1m = c1 - 1;
    c2p = c2 + 1;
    c2m = c2 - 1;

    n1 = to_string(c1m) + "_" + to_string(c2m);
    n2 = to_string(c1m) + "_" + to_string(c2);
    n3 = to_string(c1m) + "_" + to_string(c2p);
    n4 = to_string(c1) + "_" + to_string(c2p);
    n5 = to_string(c1p) + "_" + to_string(c2p);
    n6 = to_string(c1p) + "_" + to_string(c2);
    n7 = to_string(c1p) + "_" + to_string(c2m);
    n8 = to_string(c1) + "_" + to_string(c2m);

    vector<string> returnArray = { n1, n2, n3, n4, n5, n6, n7, n8 };
    return returnArray;

    // cout << c1 << ", " << c2 << endl;
}

void relevantTiles(vector<string> input) {
    for ( int i = 0; i < input.size(); i++) {
        // cout << input[i] << endl;
        cout << "current coords being calculated for neighboors: " << input[i] << endl;
        for ( int x = 0; x < 8; x++) {
            std::cout << neighbors(input[i])[x] << endl;
        }
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