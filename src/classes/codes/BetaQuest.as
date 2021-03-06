_root.codeManager.add(new Code('betaquest bq', 'Manages the Beta Quest hack.', 'betaquest / bq {start [SEED]|stop|seed}', function(command) {
    if (command[1] == 'stop') {
        _root.betaQuest.stop();
        _root.textManager.send('message', 'BetaQuest was stopped.');

    } else if (command[1] == 'start') {
        var seed = Number(command[2]);
        var resetFile = false;
        var i = 0;
        for (i = 0; i < command.length; i++) {
            if ((command[i] == '-reset') || (command[i] == '-r')) {
                resetFile = true;
            }
        }

        _root.betaQuest.start(seed, resetFile);
        _root.textManager.send('message', 'BetaQuest was started using seed ' + _root.betaQuest.getSeed() + '.');

    } else if (command[1] == 'seed') {
        if (_root.betaQuest.isStarted()) {
            _root.textManager.send('message', 'BetaQuest is currently using seed ' + _root.betaQuest.getSeed() + '.');
        } else {
            _root.textManager.send('message', 'BetaQuest is not currently running. Last seed was ' + _root.betaQuest.getSeed() + '.');
        }

    }
}));
