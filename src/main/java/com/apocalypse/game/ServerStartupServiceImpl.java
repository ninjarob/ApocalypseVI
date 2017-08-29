package com.apocalypse.game;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("serverStartupService")
class ServerStartupServiceImpl implements ServerStartupService {

    @Autowired ServerStartupDao serverStartupDao;

    public Game loadGame() {
        return serverStartupDao.loadGame();
    }

}
