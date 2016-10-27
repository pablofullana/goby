require_relative '../../../../lib/Battle/BattleCommand/Attack/attack.rb'
require_relative '../../../../lib/Battle/BattleCommand/Attack/kick.rb'
require_relative '../../../../lib/Entity/entity.rb'
require_relative '../../../../lib/Entity/player.rb'
require_relative '../../../../lib/Entity/Monster/alien.rb'


RSpec.describe Attack do

  context "constructor" do
    it "has the correct default parameters" do
      attack = Attack.new
      expect(attack.name).to eq "Attack"
      expect(attack.damage).to eq 0
      expect(attack.success_rate).to eq 100
      expect(attack.description).to eq "    Damage: 0\n"\
                                       "    Success Rate: 100%\n"
    end

    it "correctly assigns custom parameters" do
      poke = Attack.new(name: "Poke",
                        damage: 12,
                        success_rate: 95)
      expect(poke.name).to eq "Poke"
      expect(poke.damage).to eq 12
      expect(poke.success_rate).to eq 95
      expect(poke.description).to eq "    Damage: 12\n"\
                                     "    Success Rate: 95%\n"
    end
  end

  context "equality operator" do
    it "returns true for the seemingly trivial case" do
      expect(Attack.new).to eq Attack.new
    end

    it "returns false for commands with different names" do
      poke = Attack.new(name: "Poke")
      kick = Attack.new(name: "Kick")
      expect(poke).not_to eq kick
    end
  end

  it "deals random damage" do
    user = Player.new(name: "Hero",
                      max_hp: 50,
                      hp: 35,
                      attack: 12,
                      defense: 4
                      )
    enemy = Alien.new
    attack = Kick.new
    attack.run(user, enemy)
    expect(enemy.hp).to be_within(18).of(23)
  end

end
