from django.db import models

class EventGamer(models.Model):

    #on_delete delete all gamers associated
    #attributes/field names
    gamer = models.ForeignKey("Gamer", on_delete=models.CASCADE)
    event = models.ForeignKey("Event", on_delete=models.CASCADE)
    