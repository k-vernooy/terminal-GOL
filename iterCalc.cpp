#include <iostream>
#include <vector> 
#include <sstream> 
// #include <string>

using namespace std;

void neighbors(std::string data) {
    // string n1, n2, n3;
    std::string d1 = data.substr(0, 1); 
    std::string d2 = data.substr(2, 1); 

    stringstream data1(d1); 
    int c1 = 0; 
    data1 >> c1; 

    stringstream data2(d2); 
    int c2 = 0; 
    data2 >> c2; 

    cout << c1 << ", " << c2 << endl;
}

void relevantTiles(vector<string> input) {
    for ( int i = 0; i < input.size(); i++) {
        // cout << input[i] << endl;
        neighbors(input[i]);
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