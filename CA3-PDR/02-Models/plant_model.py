"""
Plant Model for Line-Follower Robot
Team 05 - MC3113 Mechatronic Systems Design
CA3: Preliminary Design Review (PDR)
Member A: C.H. Diyunuge
Date: March 24, 2026

Model Type: First-order lag system
Transfer Function: G(s) = -0.0290 / (65.26s + 1)
"""

import numpy as np
from scipy.signal import lti, lsim
import matplotlib.pyplot as plt

class PlantModel:
    """
    First-order plant model for line-follower lateral dynamics
    
    State-space representation:
    ẋ = A x + B u
    y = C x + D u
    
    Where:
    x = lateral error (e_line)
    u = steering command (u_steer)
    y = lateral error (e_line)
    """
    
    def __init__(self):
        """Initialize plant model parameters"""
        # First-order model parameters
        self.K = -0.0290      # Steady-state gain (m per unit steering)
        self.tau = 65.26      # Time constant (s)
        
        # State-space matrices (first-order)
        self.A = np.array([[-1/self.tau]])      # [-0.0153]
        self.B = np.array([[self.K/self.tau]])  # [-0.0004]
        self.C = np.array([[1.0]])              # [1]
        self.D = np.array([[0.0]])              # [0]
        
        # Create scipy LTI system
        self.sys = lti(self.A, self.B, self.C, self.D)
        
        print(f"Plant Model Initialized:")
        print(f"  Type: First-order lag system")
        print(f"  Gain (K): {self.K:.4f} m")
        print(f"  Time Constant (τ): {self.tau:.2f} s")
        print(f"  Transfer Function: G(s) = {self.K:.4f} / ({self.tau:.2f}s + 1)")
        print(f"  State-Space: A = [{self.A[0,0]:.4f}], B = [{self.B[0,0]:.6f}]")
    
    def simulate(self, u, t, x0=0):
        """
        Simulate plant response to input u
        
        Parameters:
        u: input signal (steering command)
        t: time vector
        x0: initial condition (default 0)
        
        Returns:
        t: time vector
        y: output signal (lateral error)
        x: state trajectory
        """
        t, y, x = lsim(self.sys, u, t, X0=x0)
        return t, y, x
    
    def get_transfer_function(self):
        """Return transfer function as string"""
        return f"G(s) = {self.K:.4f} / ({self.tau:.2f}s + 1)"
    
    def get_state_space(self):
        """Return state-space matrices"""
        return {
            'A': self.A,
            'B': self.B,
            'C': self.C,
            'D': self.D
        }

# Example usage and validation
if __name__ == "__main__":
    # Create plant model
    plant = PlantModel()
    
    # Create step input (u = 1.0 for 75 seconds)
    t = np.linspace(0, 75, 7501)
    u = np.ones_like(t) * 1.0
    
    # Simulate response
    t_sim, y_sim, x_sim = plant.simulate(u, t)
    
    # Plot step response
    plt.figure(figsize=(10, 6))
    plt.plot(t_sim, y_sim, 'b-', linewidth=1.5, label='Plant Model')
    plt.xlabel('Time (s)')
    plt.ylabel('Lateral Error (m)')
    plt.title('Step Response - First-Order Plant Model')
    plt.grid(True)
    plt.legend()
    plt.show()
    
    print(f"\nStep Response Summary:")
    print(f"  Final value: {y_sim[-1]:.4f} m")
    print(f"  Time constant (63.2%): {t_sim[np.where(y_sim >= 0.632*y_sim[-1])[0][0]]:.2f} s")