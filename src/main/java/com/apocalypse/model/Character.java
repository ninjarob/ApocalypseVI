package com.apocalypse.model;

import java.util.Map;

public class Character {

    //general
    private int id;
    private String name;
    private String description;
    private Race race;
    private CharacterClass characterClass;
    private int gender;  //0=other,1=male,2=female

    //base attributes
    private int level;
    private int baseStrength;
    private int baseIntelligence;
    private int baseWisdom;
    private int baseDexterity;
    private int baseConstitution;
    private int baseCharisma;
    private int baseHit;
    private int baseMana;
    private int baseMove;
    private int basePara;
    private int baseRod;
    private int basePetri;
    private int baseBreath;
    private int baseSpell;


    //onload attributes
    private Map<Integer, Item> items;
    private int age;
    private int alignment;
    private int experience;
    private int hitGain;
    private int manaGain;
    private int moveGain;
    private int attack;
    private int attacks;
    private int primaryWeaponProf;
    private int secondaryWeaponProf;
    private int thaco;
    private int damage;
    private int hunger;
    private int thirst;
    private int weightCarried;
    private int maxWeight;
    private int armorPoints;
    private int armorClass;
    private Size size;

    private int strength;
    private int intelligence;
    private int wisdom;
    private int dexterity;
    private int constitution;
    private int charisma;
    private int hit;
    private int mana;
    private int move;
    private int para;
    private int rod;
    private int petri;
    private int breath;
    private int spell;


    private int coinsoh; //coins on hand
    private int coinsb; //coins bank
    private int coinsr; //coins rent fund


    //status
    private int startCode;
    private int position;
    private int flags;
    private int room;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Race getRace() {
        return race;
    }

    public void setRace(Race race) {
        this.race = race;
    }

    public CharacterClass getCharacterClass() {
        return characterClass;
    }

    public void setCharacterClass(CharacterClass characterClass) {
        this.characterClass = characterClass;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getBaseStrength() {
        return baseStrength;
    }

    public void setBaseStrength(int baseStrength) {
        this.baseStrength = baseStrength;
    }

    public int getBaseIntelligence() {
        return baseIntelligence;
    }

    public void setBaseIntelligence(int baseIntelligence) {
        this.baseIntelligence = baseIntelligence;
    }

    public int getBaseWisdom() {
        return baseWisdom;
    }

    public void setBaseWisdom(int baseWisdom) {
        this.baseWisdom = baseWisdom;
    }

    public int getBaseDexterity() {
        return baseDexterity;
    }

    public void setBaseDexterity(int baseDexterity) {
        this.baseDexterity = baseDexterity;
    }

    public int getBaseConstitution() {
        return baseConstitution;
    }

    public void setBaseConstitution(int baseConstitution) {
        this.baseConstitution = baseConstitution;
    }

    public int getBaseCharisma() {
        return baseCharisma;
    }

    public void setBaseCharisma(int baseCharisma) {
        this.baseCharisma = baseCharisma;
    }

    public int getBaseHit() {
        return baseHit;
    }

    public void setBaseHit(int baseHit) {
        this.baseHit = baseHit;
    }

    public int getBaseMana() {
        return baseMana;
    }

    public void setBaseMana(int baseMana) {
        this.baseMana = baseMana;
    }

    public int getBaseMove() {
        return baseMove;
    }

    public void setBaseMove(int baseMove) {
        this.baseMove = baseMove;
    }

    public int getBasePara() {
        return basePara;
    }

    public void setBasePara(int basePara) {
        this.basePara = basePara;
    }

    public int getBaseRod() {
        return baseRod;
    }

    public void setBaseRod(int baseRod) {
        this.baseRod = baseRod;
    }

    public int getBasePetri() {
        return basePetri;
    }

    public void setBasePetri(int basePetri) {
        this.basePetri = basePetri;
    }

    public int getBaseBreath() {
        return baseBreath;
    }

    public void setBaseBreath(int baseBreath) {
        this.baseBreath = baseBreath;
    }

    public int getBaseSpell() {
        return baseSpell;
    }

    public void setBaseSpell(int baseSpell) {
        this.baseSpell = baseSpell;
    }

    public Map<Integer, Item> getItems() {
        return items;
    }

    public void setItems(Map<Integer, Item> items) {
        this.items = items;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAlignment() {
        return alignment;
    }

    public void setAlignment(int alignment) {
        this.alignment = alignment;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public int getHitGain() {
        return hitGain;
    }

    public void setHitGain(int hitGain) {
        this.hitGain = hitGain;
    }

    public int getManaGain() {
        return manaGain;
    }

    public void setManaGain(int manaGain) {
        this.manaGain = manaGain;
    }

    public int getMoveGain() {
        return moveGain;
    }

    public void setMoveGain(int moveGain) {
        this.moveGain = moveGain;
    }

    public int getAttack() {
        return attack;
    }

    public void setAttack(int attack) {
        this.attack = attack;
    }

    public int getAttacks() {
        return attacks;
    }

    public void setAttacks(int attacks) {
        this.attacks = attacks;
    }

    public int getPrimaryWeaponProf() {
        return primaryWeaponProf;
    }

    public void setPrimaryWeaponProf(int primaryWeaponProf) {
        this.primaryWeaponProf = primaryWeaponProf;
    }

    public int getSecondaryWeaponProf() {
        return secondaryWeaponProf;
    }

    public void setSecondaryWeaponProf(int secondaryWeaponProf) {
        this.secondaryWeaponProf = secondaryWeaponProf;
    }

    public int getThaco() {
        return thaco;
    }

    public void setThaco(int thaco) {
        this.thaco = thaco;
    }

    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }

    public int getHunger() {
        return hunger;
    }

    public void setHunger(int hunger) {
        this.hunger = hunger;
    }

    public int getThirst() {
        return thirst;
    }

    public void setThirst(int thirst) {
        this.thirst = thirst;
    }

    public int getWeightCarried() {
        return weightCarried;
    }

    public void setWeightCarried(int weightCarried) {
        this.weightCarried = weightCarried;
    }

    public int getMaxWeight() {
        return maxWeight;
    }

    public void setMaxWeight(int maxWeight) {
        this.maxWeight = maxWeight;
    }

    public int getArmorPoints() {
        return armorPoints;
    }

    public void setArmorPoints(int armorPoints) {
        this.armorPoints = armorPoints;
    }

    public int getArmorClass() {
        return armorClass;
    }

    public void setArmorClass(int armorClass) {
        this.armorClass = armorClass;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public int getStrength() {
        return strength;
    }

    public void setStrength(int strength) {
        this.strength = strength;
    }

    public int getIntelligence() {
        return intelligence;
    }

    public void setIntelligence(int intelligence) {
        this.intelligence = intelligence;
    }

    public int getWisdom() {
        return wisdom;
    }

    public void setWisdom(int wisdom) {
        this.wisdom = wisdom;
    }

    public int getDexterity() {
        return dexterity;
    }

    public void setDexterity(int dexterity) {
        this.dexterity = dexterity;
    }

    public int getConstitution() {
        return constitution;
    }

    public void setConstitution(int constitution) {
        this.constitution = constitution;
    }

    public int getCharisma() {
        return charisma;
    }

    public void setCharisma(int charisma) {
        this.charisma = charisma;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public int getMana() {
        return mana;
    }

    public void setMana(int mana) {
        this.mana = mana;
    }

    public int getMove() {
        return move;
    }

    public void setMove(int move) {
        this.move = move;
    }

    public int getPara() {
        return para;
    }

    public void setPara(int para) {
        this.para = para;
    }

    public int getRod() {
        return rod;
    }

    public void setRod(int rod) {
        this.rod = rod;
    }

    public int getPetri() {
        return petri;
    }

    public void setPetri(int petri) {
        this.petri = petri;
    }

    public int getBreath() {
        return breath;
    }

    public void setBreath(int breath) {
        this.breath = breath;
    }

    public int getSpell() {
        return spell;
    }

    public void setSpell(int spell) {
        this.spell = spell;
    }

    public int getCoinsoh() {
        return coinsoh;
    }

    public void setCoinsoh(int coinsoh) {
        this.coinsoh = coinsoh;
    }

    public int getCoinsb() {
        return coinsb;
    }

    public void setCoinsb(int coinsb) {
        this.coinsb = coinsb;
    }

    public int getCoinsr() {
        return coinsr;
    }

    public void setCoinsr(int coinsr) {
        this.coinsr = coinsr;
    }

    public int getStartCode() {
        return startCode;
    }

    public void setStartCode(int startCode) {
        this.startCode = startCode;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getFlags() {
        return flags;
    }

    public void setFlags(int flags) {
        this.flags = flags;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }
}
