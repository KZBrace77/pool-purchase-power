import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";

export default function PoolPurchasePower() {
  const [pools, setPools] = useState([]);
  const [newPool, setNewPool] = useState({ name: "", product: "", quantity: "", location: "" });

  const createPool = () => {
    if (!newPool.name || !newPool.product || !newPool.quantity || !newPool.location) return;
    setPools([...pools, { ...newPool, id: pools.length + 1, participants: [] }]);
    setNewPool({ name: "", product: "", quantity: "", location: "" });
  };

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold text-center">Pool Purchase Power</h1>
      <p className="text-center mb-4">Join forces with businesses to save on bulk purchases.</p>
      
      <Card className="p-4 mb-6">
        <h2 className="text-xl font-semibold mb-2">Create a Pool</h2>
        <Input placeholder="Pool Name" value={newPool.name} onChange={(e) => setNewPool({ ...newPool, name: e.target.value })} className="mb-2" />
        <Input placeholder="Product" value={newPool.product} onChange={(e) => setNewPool({ ...newPool, product: e.target.value })} className="mb-2" />
        <Input placeholder="Quantity" type="number" value={newPool.quantity} onChange={(e) => setNewPool({ ...newPool, quantity: e.target.value })} className="mb-2" />
        <Input placeholder="Shipping Location" value={newPool.location} onChange={(e) => setNewPool({ ...newPool, location: e.target.value })} className="mb-2" />
        <Button onClick={createPool}>Create Pool ($5 Fee)</Button>
      </Card>
      
      <h2 className="text-xl font-semibold mb-4">Active Pools</h2>
      {pools.length === 0 ? <p>No active pools. Start one now!</p> : null}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {pools.map((pool) => (
          <Card key={pool.id} className="p-4">
            <h3 className="text-lg font-bold">{pool.name}</h3>
            <p><strong>Product:</strong> {pool.product}</p>
            <p><strong>Quantity Goal:</strong> {pool.quantity}</p>
            <p><strong>Shipping Location:</strong> {pool.location}</p>
            <Button className="mt-2">Join Pool</Button>
          </Card>
        ))}
      </div>
    </div>
  );
}
