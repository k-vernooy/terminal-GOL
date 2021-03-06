#include <iostream>
#include <vector> 
#include <sstream> 
#include <string>
#include <algorithm>

using namespace std;

vector<string> neighbors(string data) {
    string n1, n2, n3, n4, n5, n6, n7, n8;

    replace(data.begin(), data.end(), '_', ' ');

    vector<int> array;
    stringstream ss(data);
    int temp;
    while (ss >> temp)
    array.push_back(temp);

    // string d1 = data.substr(0, 1); 
    // string d2 = data.substr(2, 1); 

    // NEED TO CORRECTLY REBUILD D1 AND D2

    // stringstream data1(d1); 
    // int c1 = 0; 
    // data1 >> c1; 

    // stringstream data2(d2); 
    // int c2 = 0; 
    // data2 >> c2; 
    int c1 = array[0];
    int c2 = array[1];

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
}

vector<int> liveNeighbors(vector<string> live, vector<string> tiles) {
    // passed as data (live), tiles (all relevant)

    vector<int> liveNeighbors;

    for ( int i = 0; i < tiles.size(); i++) {
        vector<string> neighborsList = {};
        neighborsList = neighbors(tiles[i]);


        // for each neighbor of every tile:
        int liveNeCount = 0;
        for ( int j = 0; j < 8; j++) {
            // if the a given neighbor of a given tile is in live, add 1 to the liveNeCount of the given tile
            if ( find(live.begin(), live.end(), neighborsList[j]) != live.end() ) {
                
                liveNeCount = liveNeCount + 1;
            }
        }
        liveNeighbors.push_back(liveNeCount);
    }
    return liveNeighbors;
}


// vector<string> addFive(vector<string> survivors) {
//     vector<string> returnVector;
//     for ( int i = 0; i < survivors.size(); i++ ) {
//         string d1 = survivors[i].substr(0, 1);
//         string d2 = survivors[i].substr(2, 1);

//         stringstream data1(d1);
//         int c1 = 0;
//         data1 >> c1;
//         c1 = c1 - 5;

//         string combined = to_string(c1) + "_" + d2;
//         returnVector.push_back(combined);
//     }
//     return returnVector;
// }


vector<string> relevantTiles(vector<string> input) {
    vector<string> relevantiles = {};

    for ( int i = 0; i < input.size(); i++ ) {
        relevantiles.push_back(input[i]);
    }

    // Relevantiles array has all live tiles stored in it

    // for each live tile
    for ( int i = 0; i < input.size(); i++) {
        vector<string> neighborArray = neighbors(input[i]);
        for ( int x = 0; x < 8; x++) {
            string curTile = neighborArray[x];
            if ( find(relevantiles.begin(), relevantiles.end(), curTile) != relevantiles.end() )
                cout << "";
            else
                relevantiles.push_back(curTile);
        }
    }
    return relevantiles;
}

int main(int argc, char *argv[]) {
    // int height, width;
    // height = argv[1];
    // width = argv[2];
    // cout << "height: " << argv[1] << endl;
    // cout << "width: " << argv[2] << endl;

    vector<string> data;

    for ( int i = argc - 1; i > 0; i--) {
        data.push_back(argv[i]);
        // cout << argv[i];
    }
    
    vector<string> tiles = relevantTiles(data);

    // for ( int i = 0; i < 8; i++ ) {
    //     cout << neighbors("7_9")[i] << endl;
    // }
    

    vector<bool> live;

    for ( int i = 0; i < tiles.size(); i++) {
        if ( find(data.begin(), data.end(), tiles[i]) != data.end() ) {
            live.push_back(true);
        }
        else {
            live.push_back(false);
        }
    }

    vector<int> neighbors = liveNeighbors(data, tiles);

    vector<string> survivors;

    for ( int i = 0; i < tiles.size(); i++) {
        // cout << tiles[i] << " " << live[i] << " " << neighbors[i] << endl;
        if ( live[i] == true && neighbors[i] == 2 ) {
            survivors.push_back(tiles[i]);
        } 
        else if ( live[i] == true && neighbors[i] == 3 ) {
            survivors.push_back(tiles[i]);
        }
        else if ( live[i] == false && neighbors[i] == 3 ) {
            survivors.push_back(tiles[i]);
        }
    }

    for (int i = 0; i < survivors.size(); i++) {
        cout << survivors[i] << " ";
    }
    cout << '\n';
    
    // TODO: IF ONE COORDINATE IS NEGATIVE, DON'T RETURN IT


}

//=========================
// Game of life logic:
//=========================
//A live cell dies if it has fewer than two live neighbors.
// A live cell with two or three live neighbors lives on to the next generation.
// A live cell with more than three live neighbors dies.
// A dead cell will be brought back to live if it has exactly three live neighbors.