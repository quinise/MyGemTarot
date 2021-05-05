//
//  Gems.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/4/21.
//

import Foundation
import SwiftUI

struct Gem: Identifiable, Codable {
    let id: UUID
    var name: String
    var descrip: String
    var card: String
    
    init(id: UUID = UUID(), name: String, descrip: String, card: String) {
        self.id = id
        self.name = name
        self.descrip = descrip
        self.card = card
    }
}

extension Gem {
    static var data: [Gem] {
        [Gem(name: "Herkmimer Diamond", descrip: "Herkimer Diamond is a high vibration and powerful crystal known as the 'attunement stone.' Herkimer Diamond unites the physical, mental, emotional, spiritual, multidimensional states with consciousness to create wholeness of being.", card:"The Magician"),
        Gem(name: "Aventurine", descrip: "Green Aventurine releases old patterns, habits and disappointments so new growth can take place. It brings optimism and a zest for life, allowing one to move forward with confidence and to embrace change. It enhances one's creativity and motivation, and encourages perseverance in maneuvering life's obstacles.", card: "The High Priestess"),
        Gem(name: "Emerald", descrip: "Through time, the emerald has been known as a symbol of truth and love. In ancient Greece and Rome, emerald was said to be the gemstone of the goddess Venus, purveyor of love and hope. ... The emerald is also known as a stone of intuition, associated with sight and the revelation of future events and truths.", card: "The Empress"),
        Gem(name: "Purpurite", descrip: "Purpurite is a purple stone that encourages you to feel free to speak out. ... This energy also has powerful healing abilities, and offers strong psychic protection. This stone has strong metaphysical properties, and is an excellent stone to help with stress.", card: "The Emperor"),
        Gem(name: "Diamond", descrip: "The Diamond, in its rarity and beauty, is a symbol of purity and innocence, of love and fidelity, and embraces strength of character, ethics, and faithfulness to oneself and others. It is indicative of the loving and open nature with which one came into the physical realm, and encourages the aspect of truth and trust.", card: "The Hierophant"),
        Gem(name: "Ruby", descrip: "The ruby is a lustrous, deep red stone that has accrued special and symbolic meaning through time. Through the ages, the ruby has represented nobility, purity, and passion. From ancient times through the modern-day, rubies have been valued by cultures around the world.", card: "The Lovers"),
        Gem(name: "Sugilite", descrip: "Thought to be a nurturing gemstone, sugilite offers release from worries. It also promotes positive emotions to help relieve stress, establish peace of mind and emotional healing. To metaphysical adherents, sugilite is a stone of forgiveness and instills the deep satisfaction of all-abiding freedom.", card: "The Chariot"),
        Gem(name: "Onyx", descrip: "In ancient Indian and Persian tales Onyx is referred to as a protector from evil. The Indian gemologists describe onyx as a protector for harmonious relationships. The stones' close union and yet strong contrast between the layers of black and white are considered symbolizing for the love between two people.", card: "Fortitude"),
        Gem(name: "Lapis Lazuli", descrip: "Lapis Lazuli is one of the most sought after stones in use since man's history began. Its deep, celestial blue remains the symbol of royalty and honor, gods and power, spirit and vision. It is a universal symbol of wisdom and truth.", card: "The Hermit"),
        Gem(name: "Alexandrite", descrip: "Since the discovery of alexandrite, the gemstone has been thought to bring luck, good fortune and love. In Russia, it is considered to be a stone of very good omen. It is believed to bring balance in the interaction between the physical manifest world and the unmanifest spiritual, or astral world.", card: "Wheel of Fortune"),
        Gem(name: "Tourmaline Quartz", descrip: "An effective grounding stone, Tourmaline Quartz strengthens the body's energy field against external invasion and deflects detrimental environmental influences. It is often seen as a symbol of unity and is an effective problem solver.", card: "Justice"),
        Gem(name: "Aquamarine", descrip: "Aquamarine evokes the purity of crystalline waters, and the exhilaration and relaxation of the sea. It is calming, soothing, and cleansing, and inspires truth, trust and letting go. ... The name Aquamarine comes from the Latin aqua marinus, meaning “water of the sea,” and refers to its sparkling ocean-like color.", card: "The Hanged Man"),
        Gem(name: "Amethyst", descrip: "Amethyst was thought to control evil thoughts, help sobriety and help overall control of one's thoughts and mindfulness. ... Ancient Egyptians gave another meaning to the crystals and were wearing jewelry with amethyst to protect against guilty and fearful feelings, along with a protection from witchcraft.", card: "Death"),
        Gem(name: "Rose Quartz", descrip: "Rose Quartz is the stone of universal love. It restores trust and harmony in relationships, encouraging unconditional love. Rose Quartz purifies and opens the heart at all levels to promote love, self-love, friendship, deep inner healing and feelings of peace.", card: "Temperance"),
        Gem(name: "Snowflake Obsidian", descrip: "A stone of purity, Snowflake Obsidian provides balance for body, mind and spirit. It helps you recognise and release “wrong thinking” and stressful mental patterns. Promotes dispassion and inner centring. Snowflake Obsidian empowers isolation and loneliness, aiding surrender in meditation.", card: "The Devil"),
        Gem(name: "Calcite", descrip: "Known as the stone of emotional intelligence, calcite has the uncanny ability to build a clear and harmonious bridge of awareness between your emotions and your intellect. Calcite reportedly brings wise energy to help one make timely decisions without the feeling of being rushed.", card: "The Tower"),
        Gem(name: "Moldavite", descrip: "Moldavite is a tektite, and a stone of intense frequency and high vibration. In ancient times it was thought to be a mystical stone that could bring good luck and fulfillment of wishes. These natural green crystals are powerful to create transformation and are thought to be the stone known as 'The Holy Grail Stone.'", card: "The Star"),
        Gem(name: "Moonstone", descrip: "A stone for “new beginnings”, Moonstone is a stone of inner growth and strength. It soothes emotional instability and stress, and stabilises the emotions, providing calmness. Moonstone enhances intuition, promotes inspiration, success and good fortune in love and business matters.", card: "The Moon"),
        Gem(name: "Sunstone", descrip: "Sunstone is linked to luck and good fortune. It clears and energises all the chakras. Sunstone instills good nature, heightens intuition and allows the real self to shine through happily. It dissipates fearfulness, alleviates stress and increases vitality.", card: "The Sun"),
        Gem(name: "Ametrine", descrip: "Ametrine is said to be the complete balance of the properties of amethyst and citrine. As a stone of both balance and connection, ametrine is believed to relieve tension, bring serenity and stimulate creativity, as well as balance mental stability and self-confidence.", card: "The Last Judgement"),
        Gem(name: "Silex", descrip: "A supreme nurutrer, excelleent for grounding. It helps with feeling secure and nurtured during times of stress. Unifies all aspects of life.", card: "The Fool"),
        Gem(name: "Watermelon Tourmaline", descrip: "Watermelon Tourmaline is a combination of pink and green Tourmaline that soothes the heart and counters anger or resentment. Used in meditation it assists with calming the mind and the emotions, allowing us to release stress.", card: "The World"),
        Gem(name: "Rhodochrosite", descrip: "Known as the Stone of the Compassionate Heart, Rhodochrosite symbolizes selfless love, moving one beyond mere empathy but stirring one to action on others' behalf. Rhodochrosite, however, directs that love first toward the self for the specific purpose of emotional healing.", card: "Page of Cups"),
        Gem(name: "Olivine", descrip: "Green is the color associated with abundance, so peridot helps attract abundance while keeping one's heart open and joyful. The wisdom of peridot is about attracting wealth with joy and by following one's true calling, rather than with hard work and persistence. Peridot can also: Promote the energy of protection.", card: "Knight of Cups"),
        Gem(name: "Gem Silica", descrip: "Gem Silica is an extremely powerful communication stone that can help one vocalize what may be lingering in their heart, mind and soul. This special mineral eases the strain one experiences when dealing with certain traumas and helps open themselves up to confiding in loved ones.", card: "Queen of Cups"),
        Gem(name: "Labradorite", descrip: "A stone of transformation, Labradorite is a useful companion through change, imparting strength and perseverance. It balances and protects the aura, raises consciousness and grounds spiritual energies. ... Labradorite treats disorders of the eyes and brain, stimulates mental acuity, and relieves anxiety and stress.", card: "King of Cups"),
        Gem(name: "Rutile Quartz", descrip: "Rutilated Quartz is an illuminator for the soul, promoting spiritual growth. It cleanses and energises the aura. Draws off negative energy and disease, letting go of the past. Rutilated Quartz gives protection against the ill thoughts of others. ... Rutilated Quartz relieves fears, phobias and anxiety.", card: "Ace of Cups"),
        Gem(name: "Dumortierite", descrip: "Dumortierite is an excellent stone for patience and calm in difficult situations. Dumortierite works with the throat chakra and the third eye chakra. A stone of communication, it also stimulates verbalisation of ideas. It promotes an understanding of the natural order of the Universe.", card: "Two of Cups"),
        Gem(name: "Pink Coral", descrip: "Pink Coral stimulates sensitivity to one's emotions and physical condition. Pink Coral stimulates and activates the Heart Chakra and enhances the intuitive aspects of love. Pink Coral fosters compassion and actions with a caring manner connected with the bonds of love.", card: "Three of Cups"),
        Gem(name: "Magnetite", descrip: "Magnetite provides stability, balancing the intellect with the emotions. It brings a balanced perspective and trust in your own intuition. Magnetite attracts love, commitment and loyalty. It alleviates negativity such as fear, anger and grief. Brings positive qualities such as tenacity and endurance.", card: "Four of Cups"),
        Gem(name: "Charoite", descrip: "Charoite is a stone of connection for all who work away from home, and for those who live alone with little contact with others. It provides emotional healing for those who suffer acute loneliness and alienation from life, and eases fears of ill-health, pain and dying.", card: "Five of Cups"),
        Gem(name: "Azurite", descrip: "Azurite cleanses and strengthens the emotional body, releasing stress and worry, and overcoming grief and sadness. It brings a healing light into consciousness allowing it to be infused into thoughts, feelings, words and action.", card: "Six of Cups"),
        Gem(name: "Sapphire", descrip: "The magnificent and holy Sapphire, in all its celestial hues, is a stone of wisdom and royalty, of prophecy and Divine favor. ... To the ancient and medieval world, Sapphire of heavenly blue signified the height of celestial hope and faith, and was believed to bring protection, good fortune and spiritual insight.", card: "Seven of Cups"),
        Gem(name: "Malachite", descrip: "Malachite is a stone of balance, abundance, manifestation and intention. ... An extremely powerful metaphysical stone, Malachite is often called the “stone of transformation” and is used for deep energy cleaning, bringing healing and positive transformation to the wearer.", card: "Eight of Cups"),
        Gem(name: "Chalcedony", descrip: "Chalcedony is a nurturing stone that promotes brotherhood and good will. It absorbs negative energy. It brings the mind, body, emotions and spirit into harmony. Chalcedony instills feelings of benevolence and generosity. It alleviates hostility and transforms melancholy into joy.", card: "Nine of Cups"),
        Gem(name: "Copper", descrip: "Named among the seven metals of alchemy, representing Venus, both the planet and the Roman goddess whose functions encompassed love, beauty, sex, fertility, prosperity and desire. The word copper comes from the word Cyprus, the island where the Romans obtained their supply.", card: "Ten of Cups"),
        Gem(name: "Sodalite", descrip: "Sodalite brings order and calmness to the mind. It encourages rational thought, objectivity, truth and intuition, along with verbalisation of feelings. Sodalite brings emotional balance and calms panic attacks. It enhances self-esteem, self-acceptance and self-trust. ... Sodalite can also help to prevent insomnia.", card: "Page of Pentacles"),
        Gem(name: "Platinum", descrip: "Platinum resonates on the frequencies of multiple dimensions and allows for interdimensional travel. When working with this metal, one is granted visions of alternate dimensions and timelines. This allows one to gain insight and revelations that ultimately lead to spiritual growth", card: "Knight of Pentacles"),
        Gem(name: "Agate", descrip: "It transforms negative energy into positive energy. Agate enhances mental function, improves concentration, enhances perception and analytical abilities. It is a soothing and calming gemstone that heals inner anger, anxiety and helps in the strengthening of relationships. Agate instills security and safety.", card: "Queen of Pentacles"),
        Gem(name: "Amber", descrip: "Amber is a powerful healer and cleanser of the body, mind and spirit. ... Amber clears depression, stimulates the intellect and promotes self-confidence and creative self-expression. It encourages decision-making, spontaneity and brings wisdom, balance and patience.", card: "King of Pentacles"),
        Gem(name: "Dioptase", descrip: "Dioptase is a vibrant talisman of the heart that can help one relinquish extremely sensitive emotions such as grief, trauma, depression, anxiety, and self-hate. This special mineral exposes one's heart and brings about soothing waves of life force energy that helps “reset” one's emotional body.", card: "Ace of Pentacles"),
        Gem(name: "Chrysocolla", descrip: "Chrysocolla, with associations of tranquility, peace, intuition, patience and unconditional love, is known as a healing stone among Native American cultures where it has been used to strengthen the body's resistance to illness and emotional duress.", card: "Two of Pentacles"),
        Gem(name: "Rohdonite", descrip: "Rhodonite is a stone of compassion, an emotional balancer that clears away emotional wounds and scars from the past, and that nurtures love. It stimulates, clears and activates the heart. Rhodonite grounds energy, balances yin-yang, and aids in achieving one's highest potential. It heals emotional shock and panic.", card: "Three of Pentacles"),
        Gem(name: "Blue Tourmaline", descrip: "In the metaphysical world, Blue Tourmaline is a crystal of Spirit and peace, providing for deep meditation and bringing past hurts to the surface for healing. It encourages the release of emotional bonds and frees the mind to explore a higher consciousness and spiritual connection.", card: "Four of Pentacles"),
        Gem(name: "Citrine", descrip: "The Citrine crystal meaning is associated with wealth and abundance, which is why it is often called “The Merchant Stone” or “The Success Stone.” In fact, if your intention involves achieving success in financial or business ventures, this is one of the best stones for boosting those manifestations.", card: "Five of Pentacles"),
        Gem(name: "Heliotrope", descrip: "Other names used for bloodstone are heliotrope and blood jasper. A stone of courage, purification, and noble sacrifice, the bloodstone has a long history of use for its healing properties.", card: "Six of Pentacles"),
        Gem(name: "Lepidolite", descrip: "A “stone of transition”, Lepidolite assists in the release and reorganisation of old behavioural and psychological patterns, gently inducing change. It brings deep emotional healing, soothing and reducing stress and depression. Lepidolite dissipates negativity and insists on being used for the highest good.", card: "Seven of Pentacles"),
        Gem(name: "Spinel", descrip: "Spinel is a stone that will help get rid of your body's toxins and wastes, both in the physical and energetic sense. Spinel is connected with energy renewal, with overcoming tough circumstances, and with your body and mind's rejuvenation.", card: "Eight of Pentacles"),
        Gem(name: "Turquoise", descrip: "Turquoise, the captivating sea-green stone of the ancients, represents wisdom, tranquility, protection, good fortune, and hope. Ancient peoples believed in its profound power to protect, as well as its tranquil energy and its association with enduring love.", card: "Nine of Pentacles"),
        Gem(name: "Tiger's Eye", descrip: "Tiger's Eye is a crystal with beautiful bands of yellow-golden color throughout. This is a powerful stone that helps you to release fear and anxiety and aids harmony and balance. It stimulates taking action, and helps you to make decisions with discernment and understanding, and unclouded by your emotions.", card: "Ten of Pentacles"),
        Gem(name: "Garnet", descrip: "Because it's such an energizing stone, garnet is often used for manifestation purposes and worn as a talisman for good luck. In addition to bringing vitality, high energy, and protection, garnet also helps build self-confidence and clarify one's life purpose.", card: "Page of Swords"),
        Gem(name: "Carnelian", descrip: "Carnelian symbolism and lore came to encompass health, luck, and royalty.", card: "Knight of Swords"),
        Gem(name: "Hawk's Eye", descrip: "Hawk's eye is believed to be a stone of protection, often used by travelers. It can also be used to help protect against the negative energy of others. It is associated with the planet Jupiter and the astrological sign of Sagittarius. Its energy is known to help balance the brow chakra.", card: "Queen of Swords"),
        Gem(name: "Gold", descrip: "Gold symbolises the purity of the spiritual aspect of 'All That Is'. It is symbolic of spirituality and development in the realm of complete understanding, allowing one to both attain and maintain communion with the source of all being. ... Gold has also been used to open and to activate the third-eye and crown chakras.", card: "King of Swords"),
        Gem(name: "Quartz Crystal", descrip: "It has been called the 'Universal Crystal' because of its many uses and is beneficial for manifesting, healing, meditation, protection and channeling. Due to its ability to balance, quartz is excellent for harmonizing and stabilizing one's environment and is helpful in romantic relationships.", card: "Ace of Swords"),
        Gem(name: "Opal", descrip: "It enkindles optimism, enthusiasm and creativity, and allows for the release of inhibitions inspiring love and passion. Opal enhances cosmic consciousness and stimulates flashes of intuition and insight, yet is a protective stone for deep inner work, meditations, and lower world shamanic journeys.", card: "Two of Swords"),
        Gem(name: "Amazonite", descrip: "Called the Stone of Courage and the Stone of Truth, Amazonite empowers one to search the self and discover one's own truths and integrity, and to move beyond fear of judgment or confrontation with others to live in alignment with those beliefs and values.", card: "Three of Swords"),
        Gem(name: "Moss Agate", descrip: "Moss agate is said to encourage tranquility and emotional balance. Moss agate is the perfect stone for those who experience strong aggression or overly nurturing emotions, helping to balance male and female energies whenever they become too extreme.", card: "Four of Swords"),
        Gem(name: "Pearl", descrip: "According to history and the myths, pearls are symbolic of wisdom gained through experience. The gems are believed to offer protection, as well as attract good luck and wealth. ... It is also said that these little gemstones are symbolic of the wearer's loyalty, generosity, integrity, and purity.", card: "Five of Swords"),
        Gem(name: "Larimar", descrip: "Larimar is commonly believed to be a calming stone, offering many incredible healing powers. It is considered by some to aid in communication and is associated with the crown, heart, third eye and throat chakras. Many alternative and holistic healers use larimar for a variety of physical, emotional and spiritual healing practices. Larimar promotes relaxation in the wearer and can be used as a worry stone.", card: "Six of Swords"),
        Gem(name: "Silver", descrip: "Silver is the metal of emotions, of the psychic mind, and of loving as well as healing. It is used to bring patience and perseverance to the wearer. When silver is used with gemstones, the metal retains and amplifies the qualities emitted by the stones.", card: "Seven of Swords"),
        Gem(name: "Colestine", descrip: "Celestite is a sweet blue high vibration crystal, with a lovely gentle uplifting energy. It has strong metaphysical properties that will help you to develop the psychic gifts of prophecy or precognition. It aids mental clarity as it clears and sharpens mental faculties and assists spiritual healing.", card: "Eight of Swords"),
        Gem(name: "Fluorite", descrip: "It absorbs and neutralises negative energy and stress. An excellent learning aid, Fluorite increases our powers of concentration, self-confidence and helps us in decision-making. It encourages positivity, balances the energies, and improves balance and coordination, both physically and mentally.", card: "Nine of Swords"),
        Gem(name: "Smokey Quartz", descrip: "In addition to the generic healing properties of Quartz, Smokey Quartz is an excellent grounding stone. ... Smokey Quartz disperses fear, lifts depression and negativity. It brings emotional calmness, relieving stress and anxiety. Promotes positive thoughts and action, and alleviates suicidal tendencies.", card: "Ten of Swords"),
        Gem(name: "Jade", descrip: "Jade is a symbol of serenity and purity. It signifies wisdom gathered in tranquility. It increases love and nurturing. A protective stone, Jade keeps the wearer from harm and brings harmony.", card: "Page of Wands"),
        Gem(name: "Iron", descrip: "Iron, classically known as the Metal of Mars, has been universally perceived as the symbol of human strength, obstinacy, fortitude, honor, courage, sharpness (of body and mind), tenacity, and confidence in power.", card: "Knight of Wands"),
        Gem(name: "Topaz", descrip: "Topaz is a stone of nobility, love, passion, and purpose. ... Because of its fiery energy, this sun-filled gemstone is certainly associated with high self-esteem and good fortune. It is a gemstone that strengthens one's confidence and trust in one's inner power and abilities.", card: "Queen of Wands"),
        Gem(name: "Hematite", descrip: "Hematite helps to absorb negative energy and calms in times of stress or worry. Hematite is a very protective stone and is great to carry to help you stay grounded in many situations. Hematite is also good for working with the Root Chakra, helping to transform negative energies into a more positive vibration. Those in relationships can benefit from the cooperation vibe coming from Hematite.", card: "King of Wands"),
        Gem(name: "Fire Opal", descrip: "Fire Opal is a stone of passion, creativity and vitality. It enhances our intuition and helps us to trust our gut while making decisions. It is connected to the Fire Element and Solar Plexus Chakra enhancing our personal power and encouraging independent thinking.", card: "Ace of Wands"),
        Gem(name: "Selenite", descrip: "Selenite provides for clarity of the mind, expanding ones awareness of the self and of ones surroundings.  It opens the crown and higher crown chakras and accesses angelic consciousness and higher guidance.  It can be used to access past lives as well as future lives.  Selenite is a calming stone that instils deep peace and is excellent for meditation or spiritual work.  It assists judgement and insight.  It clears confusion and aids in seeing the deeper picture.", card: "Two of Wands"),
        Gem(name: "Tiger Iron", descrip: "Tiger iron is said to contain the metaphysical properties of its component stones--the grounding power and circulatory affinity of hematite; the healing power and blood-cleansing abilities of red jasper; the energizing power and clarity inducing strength of tigereye--as well as being considered powerful in its own right. Tiger iron is believed to be a rare and potent three-fold stone; it grounds energies, protects the spirit and manifests the will. As such, practitioners are wary when pairing it with other stones, lest it supercharge them.", card: "Three of Wands"),
        Gem(name: "Chrysoprase", descrip: "Chrysoprase is a delightful stone of the green ray. It has metaphysical properties for healing as well as being a stone to attract new love, abundance and prosperity. It promotes joy and happiness and brings through the vibration of Divine Truth.", card: "Four of Wands"),
        Gem(name: "Kunzite", descrip: "Kunzite is a stone of romantic love, good for communication of love when you are nervous, as well as for healing heartaches. It is also a stone of self-love, promoting humility and self-tolerance. Kunzite can strengthen the human energy field, clear the aura, and clear negative energy from a room or environment.", card: "Five of Wands"),
        Gem(name: "Green Tourmaline", descrip: "Green Tourmaline attracts luck, success, abundance and prosperity. It inspires creativity, and may be used to project, create and manifest one's goals.", card: "Six of Wands"),
        Gem(name: "Zoisite with Ruby", descrip: "Zoisite with Ruby, also known as Anyolite, is an amazing natural mineral combination.Ruby is the stone of courage and strength, and purges any fear or anxiety that sit within us daily. Green Zoisite’s energy produces growth and fertility in all aspects of life. It helps us “rebirth” and have a better understanding of ourselves and our connection to the outside world. For many people who are not spiritual and just recently “awakened” their spirituality, this stone will help you along your journey of rediscovering yourself.", card: "Seven of Wands"),
        Gem(name: "Pyrite", descrip: "At its heart, Pyrite is all about protection. It’s a stone that wants to shield and protect its wearer in every way possible. Whether keeping you safe from emotional vamps or protecting you from psychic attacks, cutting through negative vibrations, clearing EMF smog or simply stopping those toxic thought patterns from running through your head, Pyrite is ever eager to keep you pure. When we are able to free ourselves of those toxic ties, we find that life loses its facades and we are able to see straight through to the truth and live in sweet authenticity. If you want to know more about the healing powers and protective properties of Pyrite keep reading.", card: "Eight of Wands"),
        Gem(name: "Black Tourmaline", descrip: "Tourmaline has been said to be a stone of reconciliation, a stone that fosters compassion and cool headedness, radiates the energy that attracts money, healing and friendship, and is used for grounding purposes, to stabilize, and reaffirm our Earth roots.", card: "Nine of Wands"),
        Gem(name: "Rubellite", descrip: "Rubellite Tourmaline soothes the emotional heart, helping to overcome fears concerning abundance, survival, stability and safety, and supports those who feel isolated or have difficulty in feeling at home in the world.", card: "Ten of Wands")
        ]
    }
}

extension Gem {
    struct Data {
        var name: String = ""
        var descrip: String = ""
        var card: String = ""
    }
    
    var data: Data {
        return Data(name: name, descrip: descrip, card: card)
    }
}
