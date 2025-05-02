local systems = {
    Input           = require('core.ecs.systems.input'),
    Jump            = require('core.ecs.systems.jump'),
    Render          = require('core.ecs.systems.render'),
    Movement        = require('core.ecs.systems.movement'),
    CoinAnimation  = require('core.ecs.systems.coin_animation'),

}

return systems
