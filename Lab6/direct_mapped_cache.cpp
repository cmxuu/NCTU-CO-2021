#include "direct_mapped_cache.h"
#include "string"
#include <iostream>
#include <stdio.h>
#include <math.h>
#include <iomanip>
#include <fstream>

using namespace std;

struct cache_dirMap {
    bool not_empty;
    unsigned int tag;
};

int log2(int n) {
    return log(n) / log(int(2));     //16 to 2
}

void my_init(cache_dirMap *cache, int line_num){
    for(int i=0; i<line_num; i++){      //init
        cache[i].not_empty = 0;
        cache[i].tag = 0;
    }
}

float direct_mapped(std::string filename, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;
    
    /*write your code HERE*/

    int offset = (int)log2(block_size);     //offset bit num
    int index_bit = (int)log2(cache_size) - offset;      //index bit num
    int line_num = cache_size >> (offset);      //block num

    cache_dirMap *cache = new cache_dirMap[line_num];

    my_init(cache, line_num);

    // open file
    unsigned int tag, index, x;
    unsigned int miss=0, hit=0;

    FILE *fp;
    fp = fopen(filename.c_str(), "r");
    while (fscanf(fp, "%x", &x) != EOF)
    {
        index = (x >> offset) & (line_num - 1);
        tag = x >> (index_bit + offset);
        if(cache[index].not_empty && cache[index].tag == tag){  // if hit
            cache[index].not_empty = true;
            hit++;
        }else{                                              //miss and replace 
            cache[index].not_empty = true;
            cache[index].tag = tag;
            miss++;
        }
    }
    fclose(fp);

    hit_num = hit;
    total_num = hit + miss;

    delete [] cache;

    return (float)hit_num/total_num;
}
