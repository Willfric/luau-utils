# luau-utils
## Modules

### Cooldown

Per-key rate limiting for abilities, chat commands and remote events.

    local Cooldown = require(path.to.Cooldown)

    local fireball = Cooldown.new(3) -- 3 second cooldown

    if fireball:try(player) then
        -- cast the spell
    end

- `Cooldown.new(seconds)` creates a cooldown timer.
- `:isReady(key)` checks a key without starting its cooldown.
- `:try(key)` returns true and starts the cooldown if the key is ready.
- `:clear(key)` forgets a key, for example when a player leaves.
