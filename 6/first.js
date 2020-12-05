#!/usr/bin/env node

'use strict'

const fs = require('fs');
const _ = require('lodash');

const s=  fs.readFileSync(process.argv[2] || "input.txt").toString();
const groups = s.split('\n\n');

let ans = 0
_.map(groups, group => {
    let lines = _.filter(group.split('\n'))
    let set = {} 
    console.log(lines);
    _.map(lines, line => {
        _.map(line, ch => {
            set[ch] = ~~set[ch] + 1;
            //console.log(ch, set[ch], lines);
            if (set[ch] == lines.length) {
                ans++;
                console.log(ch, set[ch], set, lines);
            }
        })
    })
    // console.log(Object.keys(set).length);
    // ans += Object.keys(set).length;
})

console.log(ans);



