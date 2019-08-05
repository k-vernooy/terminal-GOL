#include <iostream>
#include <vector> 

using namespace std;

int main(int argc, char *argv[]) {
    std::cout << "height: " << argv[1] << endl;
    std::cout << "width: " << argv[2] << endl;

    vector<string> data;

    for ( int i = argc - 1; i > 2; i--) {
        // std::cout << "active: " << argv[i] << endl;
        data.push_back(argv[i]);
    }
    for(int i=0; i < data.size(); ++i)
    std::cout << data[i] << ' ';
}