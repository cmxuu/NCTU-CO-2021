#include "set_associative_cache.h"
#include "string"

#include <iostream>
#include <stdio.h>
#include <math.h>
#include <iomanip>
#include <fstream>

using namespace std;

struct cache_setAssociative {
    bool not_empty[8];
    unsigned int tag[8];
    unsigned int last[8];
    int tmp;
};

void my_init(cache_setAssociative *cache, int line_num, int way){
    for(int j = 0; j < line_num; j++) {             //init
        for (int k = 0; k < way; k++)
            cache[j].not_empty[k] = false;
        cache[j].tmp = 0;
    }
}

float set_associative(string filename, int way, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;

    /*write your code HERE*/

    int offset = (int)log2(block_size);     //offset bit num
    int index_bit = (int)log2(cache_size/ way) - offset;   //index bit num
    int line_num = cache_size / block_size / way;   //block num

    cache_setAssociative *cache = new cache_setAssociative[line_num];

    my_init(cache, line_num, way);

    // open file
    unsigned int tag, index, x;
    int miss=0, hit=0;

    FILE *fp;
    fp = fopen(filename.c_str(), "r");
    int time = 0;
    while (fscanf(fp, "%x", &x) != EOF)
    {
        index = (x >> offset) & (line_num - 1);
        tag = x >> (index_bit + offset);

        bool is_hit = false;
        int LruTime = 0x3f3f3f3f;
        int LruId   = -1;

        for (int i = 0;;) {
            if (!(i < cache[index].tmp)) break;
            if (cache[index].not_empty[i] && cache[index].tag[i] == tag) { // hit
                is_hit = true;
                cache[index].last[i] = time;
                hit ++;
            }
            if (cache[index].last[i] < LruTime) { // find oldest and save to id
                LruTime = cache[index].last[i];
                LruId = i;
            }

            i++;
        }
        if (!is_hit) {                                  // miss
            if (cache[index].tmp < way) {               // miss no need replace
                int tmp = cache[index].tmp;
                cache[index].not_empty[tmp] = true;
                cache[index].tag[tmp] = tag;
                cache[index].last[tmp] = time;
                cache[index].tmp ++;
            } else {                                    // miss need replace
                cache[index].not_empty[LruId] = true;
                cache[index].tag[LruId] = tag;
                cache[index].last[LruId] = time;
            }
            miss ++;
        }

        time ++;
    }
    fclose(fp);

    hit_num = hit;
    total_num = hit + miss;

    delete [] cache;
    
    return (float)hit_num/total_num;
}
