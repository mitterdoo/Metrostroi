--------------------------------------------------------------------------------
-- Панели с реле и контакторами (ПР-143, ПР-144)
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("PR_14X_Panels")

function TRAIN_SYSTEM:Initialize()
	----------------------------------------------------------------------------
	-- ПР-143
	----------------------------------------------------------------------------
	-- Контактор включения провода 1 (Р1-Р5)
	self.Train:LoadSystem("R1_5","Relay","KPD-110E")
	-- Контактор 6-ого провода (К6)
	self.Train:LoadSystem("K6","Relay","KPD-110E")
	-- Реле времени торможения (РВТ)
	self.Train:LoadSystem("RVT","Relay","REV-811T")
	-- Реле педали бдительности (РПБ)
	self.Train:LoadSystem("RPB","Relay","REV-813T", { open_time = 2.5 })
	
	
	
	----------------------------------------------------------------------------
	-- ПР-144
	----------------------------------------------------------------------------
	-- Контактор 25ого провода (К25)
	self.Train:LoadSystem("K25","Relay","PR-143")
	-- Реле-повторитель провода 8 (РП8)
	self.Train:LoadSystem("Rp8","Relay","REV-811T")
	-- Контактор дверей (КД)
	self.Train:LoadSystem("KD","Relay","REV-811T")
	-- Реле освещения (РО)
	self.Train:LoadSystem("RO","Relay","KPD-110E")	
end

function TRAIN_SYSTEM:Think()
	self.Train.RPB:TriggerInput("Close",self.Train.PB.Value)
end