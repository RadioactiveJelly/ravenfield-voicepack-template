-- Register the behaviour
behaviour("VoicePack")

function VoicePack:Start()
	self.team = self.script.mutator.GetConfigurationDropdown("assignedTeam")
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.hasInfantryLines = self.dataContainer.GetBool("hasInfantryLines")
	self.hasAnnouncerLines = self.dataContainer.GetBool("hasAnnouncerLines")

	if self.team == 2 then
		self:AssignToBothTeams()
	elseif self.team == 0 or self.team == 1 then
		self:AssignToSingleTeam(self.team)
	end
end

function VoicePack:AssignToSingleTeam(team)
	local targetString = ""
	if team == 0 then
		targetString = "TeamVoicesMutator(Eagle)(Clone)"
	elseif team == 1 then
		targetString = "TeamVoicesMutator(Raven)(Clone)"
	end

	local targetObject = self.gameObject.Find(targetString)
	if targetObject == nil then
		print("No team voice object found!")
		return
	end

	local targetVoice = targetObject.GetComponent(ScriptedBehaviour)

	self:WrapAnnouncer()

	targetVoice.self:AddVoicePack(self)
end

function VoicePack:AssignToBothTeams()
	local eagleObj = self.gameObject.Find("TeamVoicesMutator(Eagle)(Clone)")
	local ravenObj = self.gameObject.Find("TeamVoicesMutator(Raven)(Clone)")

	self:WrapAnnouncer()

	if eagleObj then
		local eagleVoice = eagleObj.GetComponent(ScriptedBehaviour)
		eagleVoice.self:AddVoicePack(self)
	end

	if ravenObj then
		local ravenVoice = ravenObj.GetComponent(ScriptedBehaviour)
		ravenVoice.self:AddVoicePack(self)
	end
end

function VoicePack:WrapAnnouncer()
	self.announcer = {}
	self.announcer.name = self.gameObject.GetComponent(DataContainer).GetString("announcerName")
	self.announcer.winBank = self.targets.WinBank
	self.announcer.loseBank = self.targets.LoseBank
	self.announcer.pointCapturedBank = self.targets.PointCapturedBank
	self.announcer.pointLostBank = self.targets.PointLostBank
	self.announcer.capturingPointBank = self.targets.CapturingPointBank
	self.announcer.losingPointBank = self.targets.LosingPointBank
	self.announcer.takeControlBank = self.targets.TakeControlBank
	self.announcer.lostControlBank = self.targets.LostControlBank
	self.announcer.tiedControlBank = self.targets.TiedControlBank
end

function VoicePack:GetVoicePackName()
	return self.dataContainer.GetString("voicePackName")
end

function VoicePack:GetDeathBank()
	return self.targets.DeathBank
end

function VoicePack:GetKillBank()
	return self.targets.KillBank
end

function VoicePack:GetDirectionalBank()
	return self.targets.DirectionalBank
end

function VoicePack:GetFriendlyFireBank()
	return self.targets.FriendlyFireBank
end