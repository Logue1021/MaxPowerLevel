using System.Collections.Generic;
using System.Threading.Tasks;
using Destiny2;
using MaxPowerLevel.Models;

namespace MaxPowerLevel.Services
{
    public interface IMaxPowerService
    {
         Task<IDictionary<ItemSlot.SlotHashes, Item>> ComputeMaxPowerAsync(BungieMembershipType type, long accountId, long characterId);
         Task<IDictionary<long, IDictionary<ItemSlot.SlotHashes, Item>>> ComputeMaxPowerAsync(BungieMembershipType type, long accountId);
         decimal ComputePower(IEnumerable<Item> items);
    }
}