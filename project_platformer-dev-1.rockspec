package = "project_platformer"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/desk467/project-platformer.git"
}
description = {
   homepage = "https://github.com/desk467/project-platformer",
   license = "Proprietary"
}

dependencies = {
   "bump >= 3.1.7"
}
build = {
   type = "builtin",
   modules = {
      conf = "conf.lua",
      ["core.components"] = "core/ecs/components/init.lua",
      ["core.ecs.components.active"] = "core/ecs/components/active.lua",
      ["core.ecs.components.drawable"] = "core/ecs/components/drawable.lua",
      ["core.ecs.components.position"] = "core/ecs/components/position.lua",
      ["core.ecs.components.velocity"] = "core/ecs/components/velocity.lua",
      ["core.ecs.entity"] = "core/ecs/entity.lua",
      ["core.ecs.systems.coin_animation"] = "core/ecs/systems/coin_animation.lua",
      ["core.ecs.systems.input"] = "core/ecs/systems/input.lua",
      ["core.ecs.systems.jump"] = "core/ecs/systems/jump.lua",
      ["core.ecs.systems.movement"] = "core/ecs/systems/movement.lua",
      ["core.ecs.systems.render"] = "core/ecs/systems/render.lua",
      ["core.gamestate"] = "core/gamestate.lua",
      ["core.input"] = "core/input.lua",
      ["core.systems"] = "core/ecs/systems/init.lua",
      font = "font.lua",
      main = "main.lua",
      ["states.game.entities.coin"] = "states/game/entities/coin.lua",
      ["states.game.entities.fire"] = "states/game/entities/fire.lua",
      ["states.game.entities.gate"] = "states/game/entities/gate.lua",
      ["states.game.entities.player"] = "states/game/entities/player.lua",
      ["states.game.entities.title"] = "states/game/entities/title.lua",
      ["states.game.entities.wall"] = "states/game/entities/wall.lua",
      ["states.game.entity_factory"] = "states/game/entity_factory.lua",
      ["states.game.event_bus"] = "states/game/event_bus.lua",
      ["states.game.events"] = "states/game/events.lua",
      ["states.game.game"] = "states/game/game.lua",
      ["states.game.init"] = "states/game/init.lua",
      ["states.game.levels"] = "states/game/levels.lua",
      ["states.game.world"] = "states/game/world.lua",
      ["states.gameover"] = "states/gameover.lua",
      ["states.help"] = "states/help.lua",
      ["states.menu.entities.menu_items"] = "states/menu/entities/menu_items.lua",
      ["states.menu.entities.title"] = "states/menu/entities/title.lua",
      ["states.menu.init"] = "states/menu/init.lua",
      ["states.menu.menu"] = "states/menu/menu.lua",
      ["states.win"] = "states/win.lua"
   }
}
