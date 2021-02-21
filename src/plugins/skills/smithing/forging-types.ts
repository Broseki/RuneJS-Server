import { Item } from '@server/world/items/item';
export interface Smithable {
    item: Item;
    level: number;
    experience: number;
    ingredient: Item;
}
