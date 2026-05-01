
local L = LibStub("AceLocale-3.0"):NewLocale("Combuctor", "ruRU")
if not L then return end

L.Updated = 'Обновлен'

--binding actions
L.ToggleInventory = "Инвентарь"
L.ToggleBank = "Банк"

--frame titles
L.InventoryTitle = "Инвентарь"
L.BankTitle = "Банк"

--tooltips
L.Inventory = 'Инвентарь'
L.Bank = 'Банк'
L.TotalOnRealm = 'Всего'
L.ClickToPurchase = '<Кликните> чтобы приобрести'
L.Bags = 'Сумки'
L.BagToggle = ''
L.InventoryToggle = ''
L.BankToggle = ''
L.MoveTip = ''
L.ResetPositionTip = ''

--default sets (need to be here because of a flaw in how I save things
--these are automatically localized (aka, don't translate them :)
do
	L.All = ALL

	L.Weapon, L.Armor, L.Container, L.Consumable, L.Glyph, L.TradeGood, 
 	L.Projectile, L.Quiver, L.Recipe, L.Gem, L.Misc, L.Quest = GetAuctionItemClasses()

	L.Trinket = getglobal('INVTYPE_TRINKET')

	L.Devices, L.Explosives = select(10, GetAuctionItemSubClasses(6))

	L.SimpleGem = select(8, GetAuctionItemSubClasses(7))
end

L.Normal = 'Обычное'
L.Equipment = 'Обмундирование'
L.Keys = 'Ключи'
L.Trade = 'Товары'
L.Ammo = 'Боеприпасы'
L.Shards = 'Камни'
L.SoulShard = 'Камни душ'
L.Usable = 'Расходуемые'