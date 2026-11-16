import net.minecraft.SharedConstants;
import net.minecraft.server.Bootstrap;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.world.level.block.Block;

public class block_stats {
    public static void main() {
        SharedConstants.tryDetectVersion();
        Bootstrap.bootStrap();

        for (Block block : BuiltInRegistries.BLOCK) {
            System.out.println(
                BuiltInRegistries.BLOCK.getKey(block) + " " +
                block.defaultDestroyTime() + " " +
                block.getExplosionResistance()
            );
        }
    }
}