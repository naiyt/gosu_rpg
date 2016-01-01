require 'gosu'
require 'gosu_rpg/config'
require 'gosu_rpg/version'
require 'gosu_rpg/exceptions'
require 'gosu_rpg/game_window'
require 'gosu_rpg/game_state'

module GosuRPG
  def self.configure
    yield config
  end

  def self.config
    @config || Config.new
  end

  def self.reset
    @config = Config.new
  end
end
