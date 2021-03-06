#import	"ThingPanel.h"
#import "ThingWindow.h"
#import	"TextureEdit.h"

@implementation ThingWindow

- setParent:(id)p
{
	parent_i = p;
	return self;
}

//===================================================================
//
//	Match keypress to first letter
//
//===================================================================
- keyDown:(NXEvent *)event
{
	char	key[2];
	char	string2[32];
	int		max;
	int		i;
	thinglist_t	*t;
	id		thingList_i;
	int		found;
	int		size;
	int		tries;
	
	key[0] = event->data.key.charCode;
	strupr(key);
	strcat(string,key);
	size = strlen(string);
		
	thingList_i = [parent_i  getThingList];
	max = [thingList_i	count];
	tries = 2;
	
	while(tries)
	{
		found = 0;
		
		for (i = 0;i < max; i++)
		{
			t = [thingList_i	elementAt:i];
			strcpy(string2,t->name);
			strupr(string2);
				
			if (!strncmp(string,string2,size))
			{
				[parent_i	scrollToItem:i];
				found = 1;
				tries = 0;
				break;
			}
		}
		
		if (!found)
		{
			string[0] = key[0];
			string[1] = 0;
			strupr(string);
			size = 1;
			tries--;
		}
	}
	
	return self;
}

@end
