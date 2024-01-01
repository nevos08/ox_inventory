import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectLeftInventory } from '../../store/inventory';
import InventoryControl from './InventoryControl';

const LeftInventory: React.FC = () => {
  const leftInventory = useAppSelector(selectLeftInventory);

  return (
    <div className="left-inventory-wrapper">
      <InventoryGrid inventory={leftInventory} />
      <InventoryControl />
    </div>
  );
};

export default LeftInventory;
