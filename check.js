const fs = require('fs');

const runDirs = fs.readdirSync('run-assets');

for (const runDir of runDirs) {
    const logs = fs.readdirSync('run-assets/' + runDir)
        .filter(p => p.includes('devtools'))
        .map(p => fs.readFileSync('run-assets/' + runDir + '/' + p, 'utf-8'))
        .map(JSON.parse);
    
    console.log('\n\n\n===============');
    console.log(runDir);
    console.log('===============');
    
    for (const log of logs) {
        const totalsById = {};

        for (const message of log) {
            const id = message.params.requestId;
            
            if (process.env.DEBUG_ID) {
                if (process.env.DEBUG_ID.includes(' ')) {
                    if (!process.env.DEBUG_ID.includes(id)) {
                        continue;
                    }
                } else {
                    if (process.env.DEBUG_ID != id) {
                        continue;
                    }
                }
            }

            if (process.env.DEBUG) console.log(message);

            if (message.method === 'Network.requestWillBeSent') {
                totalsById[id] = {
                    url: message.params.request.url,
                    accumulated: 0,
                    finished: 0,
                }
            }
            if (message.method === 'Network.responseReceived') {
                totalsById[id].accumulated = message.params.response.encodedDataLength;
            }
            if (message.method === 'Network.requestServedFromCache') {
                totalsById[id] = {
                    accumulated: 0,
                    finished: 0,
                    fromCache: true,
                }
            }
            if (message.method === 'Page.lifecycleEvent' && message.params.name === 'init') {
                totalsById[message.params.loaderId] = {
                    accumulated: 0,
                    finished: 0,
                }
            }
            if (message.method === 'Network.dataReceived') {
                totalsById[id].accumulated += message.params.encodedDataLength;
            }
            if (message.method === 'Network.loadingFinished') {
                totalsById[id].finished = message.params.encodedDataLength;
            }
            if (message.method === 'Network.loadingFailed') {
                delete totalsById[id];
            }
        }

        for (const [id, total] of Object.entries(totalsById)) {
            if (total.accumulated != total.finished && !total.fromCache)
                console.log(id, total.url, 'acc', total.accumulated, 'finished', total.finished);
        }
    }
}